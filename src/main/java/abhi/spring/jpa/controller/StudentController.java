package abhi.spring.jpa.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import abhi.spring.jpa.binding.Student;
import abhi.spring.jpa.entity.StudentEntity;
import abhi.spring.jpa.repo.StudentRepo;

@Controller
public class StudentController {
	@Autowired
	StudentRepo repo;

	@GetMapping("/")
	public String loadForm(Model model) {

		loadFormData(model);
		return "index";

	}

	private void loadFormData(Model model) {
		List<String> courseList = new ArrayList<>();
		courseList.add("Java");
		courseList.add("Pythan");
		courseList.add("C#");
		courseList.add("C++");
		courseList.add("Ruby");
		courseList.add("AWS");
		courseList.add("DevOps");
		List<String> timingList = new ArrayList<>();
		timingList.add("Morning");
		timingList.add("Afternoon");
		timingList.add("Evening");
		Student student = new Student();
		model.addAttribute("course", courseList);
		model.addAttribute("timing", timingList);
		model.addAttribute("Student", student);
	}

	@PostMapping("/save")
	public String HandleSubmit(Student student, Model model) {
		System.out.println(student);

		model.addAttribute("msg", "Student Saved");
		StudentEntity entity = new StudentEntity();
		entity.setTiming(Arrays.toString(student.getTiming()));
		BeanUtils.copyProperties(student, entity);
		repo.save(entity);
		loadFormData(model);
		return "index";

	}

	@GetMapping("/viewStudents")
	public String getViewStudent(Model model) {
		List<StudentEntity> Studentlist = repo.findAll();
		model.addAttribute("students", Studentlist);
		return "data";
	}

}
