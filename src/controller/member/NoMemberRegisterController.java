package controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.NoMemberDAO;
import model.member.NoMemberDTO;

public class NoMemberRegisterController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/backend/member/NoMemberTruckRegister.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String addr = req.getParameter("roadAddrPart1").equals("선택하신 곳에서 도로명주소를 얻을 수 없습니다.")?req.getParameter("roadAddrPart1.5"):req.getParameter("roadAddrPart1");
		System.out.println(addr);
		NoMemberDTO dto = new NoMemberDTO();
		NoMemberDAO dao = new NoMemberDAO(req.getServletContext());
		dto.setTname(req.getParameter("tname"));
		dto.setTel(req.getParameter("tel"));
		dto.setAddr(addr);
		dto.setCorporate_no(req.getParameter("corpNo"));
		int affected = dao.insert(dto);
		dao.close();
		req.setAttribute("WHERE", "NOMEMBERREGISTER");
		req.setAttribute("SUC_FAIL", affected);
		req.getRequestDispatcher("/backend/pages/common/Fail.jsp").forward(req, resp);
	}
}