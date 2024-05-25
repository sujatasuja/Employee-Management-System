package com.pagecontroller.in;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.EMSbackend.in.dao.EmplDao;
import com.EMSbackend.in.entities.Employee;
import com.EMSbackend.in.entities.User;
import com.EMSbackend.in.helper.Message;

@Controller
public class UserController {

	@RequestMapping("/dashboard")
	public String dashboard() {
		return "Dashboard";
	}

	// go to add employee
	@Autowired
	private EmplDao empldao;

	@RequestMapping("/addemployee")
	public String addemployee() {

		return "addemployee";
	}

	@PostMapping("/addedemp")
	public String empAdded(@ModelAttribute("employee") Employee employee, HttpSession session,
			HttpServletRequest request, Model model) {

		session = request.getSession();
		User user = (User) session.getAttribute("user");
		employee.setUser(user);
		boolean addEmployee = empldao.addEmployee(employee);

		if (addEmployee) {
			session.setAttribute("msg", new Message("Employee Added Successfully", "alert-success"));
			return "redirect:/addemployee";
		} else {
			session.setAttribute("msg", new Message("An Error Occurred", "alert-danger"));
			return "redirect:/addemployee";
		}

	}

	// view employee//

	@RequestMapping("/viewemployee/{id}")
	public String viewemployee(@PathVariable("id") int id, Model model, HttpSession session) {

		User user = (User) session.getAttribute("user");
		List<Employee> viewAllEmployees = empldao.getEmployeesByUser(id);
		if (user.getId() == id) {
			model.addAttribute("emp", viewAllEmployees);
		}

		model.addAttribute("title", "View Employees");
		return "viewemployee";
	}

	@GetMapping("/deleteEmp/{emplId}")
	public String deleteEmp(@PathVariable("emplId") int emplId, HttpSession session) {

		empldao.deleteEmployee(emplId);

		User user = (User) session.getAttribute("user");

		return "redirect:/viewemployee/" + user.getId();

	}

	@GetMapping("/updateEmp/{eid}")
	public String updateEmp(@PathVariable("eid") int eid, Model model) {

		Employee employeeById = empldao.getEmployeeById(eid);

		model.addAttribute("employee", employeeById);
		model.addAttribute("title", "Update Employee");

		return "updateEmp";

	}
	
	@PostMapping("/updated")
	public String updatedEmp( @ModelAttribute("employee") Employee employee,  Model model,
			HttpServletRequest request, HttpSession session) {

		

		session = request.getSession();
		User user = (User) session.getAttribute("user");
		employee.setUser(user);
		boolean updatEmployee = empldao.updatEmployee(employee);

		if (updatEmployee) {
			session.setAttribute("msg", new Message("Employee Updated Successfully", "alert-success"));
			return "redirect:/addemployee";
		} else {
			session.setAttribute("msg", new Message("An Error Occurred", "alert-danger"));
			return "redirect:/addemployee";
		}
	}

	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {

			session.removeAttribute("user");
			session.setAttribute("msg", new Message("Logout Successfully", "alert-success"));

		}
		return "redirect:/login";
	}
}
