package springboot.deploy.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import springboot.deploy.entities.DeploymentSheet;

public interface Deploymentdao extends CrudRepository<DeploymentSheet,Integer>{

	//Get Pending Request for Development Manager and Deparment HOD
	@Query(nativeQuery=true,value="select * from deployment_sheet where DATE(entry_date_time)>=:d1 AND DATE(entry_date_time)<=:d2 AND department like %:Dept% AND status='Pending'")
	List<DeploymentSheet> getPendingRequestsByEntryDateAndDept(String d1,String d2,String Dept);
	
	//Get Pending Request for Contractor Developer
	@Query(nativeQuery=true,value="select * from deployment_sheet where DATE(entry_date_time)>=:d1 AND DATE(entry_date_time)<=:d2 AND department =:Dept AND developer=:name  AND status='Pending'")
	List<DeploymentSheet> getPendingRequestsByDateDeptName(String d1,String d2,String Dept,String name);
	
	@Transactional
	@Modifying
	@Query("update DeploymentSheet request set request.status = :status,request.actiondate=NOW(),actionby=:actionby where request.id = :id")
	int updateStatusForDeploymentRequest(@Param("status") String status, @Param("id") int id,@Param("actionby") String actionby);
	
	//Onload list for manager
	@Query(nativeQuery=true,value="select * from deployment_sheet where DATE(entry_date_time)>=:d1 AND DATE(entry_date_time)<=:d2  AND status=:st")
	List<DeploymentSheet> getRequestsByEntryDate(@Param("d1") String fromDate,@Param("d2") String toDate,@Param("st") String Status);
	
	//Onload list for deptHOD
	@Query(nativeQuery=true,value="select * from deployment_sheet where DATE(entry_date_time)>=:d1 AND DATE(entry_date_time)<=:d2 AND department=:dept  AND status=:st")
	List<DeploymentSheet> getRequestsByDateAndDept(@Param("d1") String fromDate,@Param("d2") String toDate,@Param("dept") String Department,@Param("st") String Status);
	
	
	//Onload list for developer
	@Query(nativeQuery=true,value="select * from deployment_sheet where DATE(entry_date_time)>=:d1 AND DATE(entry_date_time)<=:d2 AND developer=:name  AND status=:st")
	List<DeploymentSheet> getRequestsByDateAndName(@Param("d1") String fromDate,@Param("d2") String toDate,@Param("st") String Status,@Param("name") String name);
	
	//Irrespective of Status(status=All)
	@Query(nativeQuery=true,value="select * from deployment_sheet where DATE(entry_date_time)>=:d1 AND DATE(entry_date_time)<=:d2  AND department=:dept AND project_name=:p AND developer=:dev ")
	List<DeploymentSheet> getRequests1(@Param("d1") String fromDate,@Param("d2") String toDate,@Param("dept") String Department,@Param("p") String Project,@Param("dev") String name);
	
	 //Irrespective of Department(department=All)
	 @Query(nativeQuery=true,value="select * from deployment_sheet where DATE(entry_date_time)>=:d1 AND DATE(entry_date_time)<=:d2 AND project_name=:p  AND status=:s AND developer=:dev ")
	 List<DeploymentSheet> getRequests2(@Param("d1") String fromDate,@Param("d2") String toDate,@Param("s") String Status,@Param("p") String Project,@Param("dev") String name);
	
	//Irrespective of Name (name=All)
	@Query(nativeQuery=true,value="select * from deployment_sheet where DATE(entry_date_time)>=:d1 AND DATE(entry_date_time)<=:d2 AND department=:dept AND project_name=:p  AND status=:s")
	List<DeploymentSheet> getRequests3(@Param("d1") String fromDate,@Param("d2") String toDate,@Param("dept") String Department,@Param("p") String Project,@Param("s") String Status);
	 
	//Irrespective of Project(project=All)
	@Query(nativeQuery=true,value="select * from deployment_sheet where DATE(entry_date_time)>=:d1 AND DATE(entry_date_time)<=:d2 AND department=:dept  AND status=:s AND developer=:n")
	List<DeploymentSheet> getRequests4(@Param("d1") String fromDate,@Param("d2") String toDate,@Param("dept") String Department,@Param("s") String Status,@Param("n") String name);
	 
	//Taking every condition
	 @Query(nativeQuery=true,value="select * from deployment_sheet where DATE(entry_date_time)>=:d1 AND DATE(entry_date_time)<=:d2 AND department=:dept AND project_name=:p AND developer=:n  AND status=:s")
	 List<DeploymentSheet> getApprovedRequests(@Param("d1") String fromDate,@Param("d2") String toDate,@Param("dept") String Department,@Param("p") String Project,@Param("n") String name,@Param("s") String Status);
	 
	 
	
}
