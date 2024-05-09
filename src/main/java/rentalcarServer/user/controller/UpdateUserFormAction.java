package rentalcarServer.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rentalcarServer.user.model.UserDao;
import rentalcarServer.user.model.UserRequestDto;
import rentalcarServer.user.model.UserResponseDto;

/**
 * Servlet implementation class UpdateUserFormAction
 */
public class UpdateUserFormAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserFormAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();

		UserDao userDao = UserDao.getInstance();
		
		UserResponseDto user = (UserResponseDto) session.getAttribute("user");

		String password = request.getParameter("password");

		// 입력된 패스워드 검증 후, 
		if(userDao.findUserByIdAndPassword(user.getId(), password) != null) {
			UserRequestDto userDto = new UserRequestDto();
			
			userDto.setId(user.getId());
			userDto.setPassword(password);
			
			String newPassword = request.getParameter("password-new");
			String email = request.getParameter("email");
			
			String license = request.getParameter("license");
			System.out.println("license: " + license);
			
			String telecom = request.getParameter("telecom");
			String phone = request.getParameter("phone");
			
			
			if(user.getEmail() != null && !user.getEmail().equals(email)) {
				userDto.setEmail(email);
				user = userDao.updateUserEmail(userDto);
			}
			System.out.println("user 0) : " + user);
			
//			if((user.getEmail() != null && !user.getEmail().equals(email)) || (user.getEmail() == null && !email.equals(""))) {
//				userDto.setEmail(email);
//				user = userDao.updateUserEmail(userDto);
//			}
			
			if(!license.equals(user.getLicense())) {
				userDto.setLicense(license);
				user = userDao.updateUserLicense(userDto);
			}
			System.out.println("user 1) : " + user);
			
			if(!user.getTelecom().equals(telecom) || !user.getPhone().equals(phone)) {
				userDto.setTelecom(telecom);
				userDto.setPhone(phone);
				user = userDao.updateUserPhone(userDto);
			}
			System.out.println("user 2) : " + user);
			
			if(!newPassword.equals("") && !newPassword.equals(password)) {
				user = userDao.updateUserPassword(userDto, newPassword);
			}
		}
		session.setAttribute("user", user);
		response.sendRedirect("/myPage");

	}

}
