package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class CustomerDAO {
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	public CustomerDAO(ServletContext context) {
		try {
			Context ctx = new InitialContext();
			DataSource source = (DataSource)ctx.lookup(context.getInitParameter("TOMCAT_JNDI_ROOT")+"/jndi/ft");
			conn=source.getConnection();
		} catch (Exception e) {e.printStackTrace();}
	}

	public void close() {
		try {
			if(rs!=null)rs.close();
			if(psmt!=null)psmt.close();
			if(conn!=null)conn.close();
		} catch (Exception e) {}
	}
	
	public CustomerDTO selectOne(String no) {	
		String sql = "SELECT * FROM customer WHERE g_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			while(rs.next()) {
				CustomerDTO dto = new CustomerDTO();
				dto.setG_no(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setPwd(rs.getString(3));
				dto.setName(rs.getString(4));
				dto.setTel(rs.getString(5));
				dto.setRegidate(rs.getDate(6));
				return dto;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}

	public List<CustomerDTO> selectList() {
		List<CustomerDTO> list = new Vector();
		String sql = "SELECT * FROM customer ORDER BY g_no DESC";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				CustomerDTO dto = new CustomerDTO();
				dto.setG_no(rs.getString(1));
				dto.setId(rs.getString(2));
				dto.setPwd(rs.getString(3));
				dto.setName(rs.getString(4));
				dto.setTel(rs.getString(5));
				dto.setRegidate(rs.getDate(6));
				list.add(dto);
				//System.out.println("리스트에 담음 : "+dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public String selectToday() {
		String count="";
		String sql = "SELECT count(*) FROM customer WHERE TO_DATE(regidate, 'YYYY-MM-DD') >= TO_DATE(sysdate,'YYYY-MM-DD')";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if(rs.next()) {
				count=rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public int delete(String no) {
		int affected=0;
		String sql = "DELETE FROM customer WHERE g_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			affected = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}

	public int update(CustomerDTO dto) {
		int affected=0;
		String sql="UPDATE customer SET id=?, pwd=?, name=? WHERE g_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPwd());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getG_no());
			affected = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}
}
