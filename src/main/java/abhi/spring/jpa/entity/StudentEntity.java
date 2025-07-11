package abhi.spring.jpa.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
@Entity
@Table(name="Student")
public class StudentEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String name;
	private String email;
	private String gender;
	private String course;
	private String timing;
	public StudentEntity() {
		super();
		System.out.println("Default Constrctor in class StudentEntity");
		
	}
	public StudentEntity(String name, String email, String gender, String course, String timing) {
		super();
		this.name = name;
		this.email = email;
		this.gender = gender;
		this.course = course;
		this.timing = timing;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getTiming() {
		return timing;
	}
	public void setTiming(String timing) {
		this.timing = timing;
	}
	@Override
	public String toString() {
		return "StudentEntity [id=" + id + ", name=" + name + ", email=" + email + ", gender=" + gender + ", course="
				+ course + ", timing=" + timing + "]";
	}
	
	

}
