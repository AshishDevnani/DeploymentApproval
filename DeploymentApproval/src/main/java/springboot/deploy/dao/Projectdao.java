package springboot.deploy.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import springboot.deploy.entities.Project;

public interface Projectdao extends CrudRepository<Project,Integer> {

	public List<Project> findAll();
	
	@Transactional
	@Modifying
	@Query("update Project p set p.ProjectName=:project,p.DeploymentPath=:path,p.ServerIP=:ip where id=:projid")
	public int updateProject(@Param("project") String project,@Param("path") String path,@Param("ip") String ip,@Param("projid") int id);
}
