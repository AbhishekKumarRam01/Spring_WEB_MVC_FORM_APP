package abhi.spring.jpa.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import abhi.spring.jpa.entity.StudentEntity;
@Repository
public interface StudentRepo extends JpaRepository<StudentEntity,Integer> {

}
