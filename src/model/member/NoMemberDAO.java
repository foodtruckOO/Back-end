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

public class NoMemberDAO {
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement psmt;
	
	public NoMemberDAO(ServletContext context) {
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
	
	public NoMemberDTO selectOne(String no) {	
		String sql = "SELECT * FROM foodtrucks WHERE f_no=?";
		NoMemberDTO dto;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new NoMemberDTO();
				dto.setF_no(rs.getString(1));
				dto.setTname(rs.getString(2));
				dto.setAddr(rs.getString(3));
				dto.setAddr2(rs.getString(4));
				dto.setTel(rs.getString(5));
				dto.setAttachedFile(rs.getString(6));
				return dto;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}

	public List<NoMemberDTO> selectList() {
		List<NoMemberDTO> list = new Vector();
		String sql = "SELECT * FROM foodtrucks ORDER BY f_no DESC";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				NoMemberDTO dto = new NoMemberDTO();
				psmt.setString(1, dto.getF_no());
				psmt.setString(2, dto.getTname());
				psmt.setString(3, dto.getAddr());
				psmt.setString(4, dto.getAddr2());
				psmt.setString(5, dto.getTel());
				psmt.setString(6, dto.getAttachedFile());
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insert(NoMemberDTO dto) {
		int affected=0;
		String sql="INSERT INTO foodtrucks VALUES(seq_foodtrucks.nextval, ?, ?, ?, ?, ?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTname());
			psmt.setString(2, dto.getAddr());
			psmt.setString(3, dto.getAddr2());
			psmt.setString(4, dto.getTel());
			psmt.setString(5, dto.getAttachedFile());
			affected = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}
	
	
	
	public int delete(String f_no) {
		int affected=0;
		String sql = "DELETE FROM foodtrucks WHERE f_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, f_no);
			affected = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}

	public int update(NoMemberDTO dto) {
		int affected=0;
		String sql="UPDATE foodtrucks SET tname=?, addr=?, addr2=?, tel=?, attachedFile=? WHERE f_no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTname());
			psmt.setString(2, dto.getAddr());
			psmt.setString(3, dto.getAddr2());
			psmt.setString(4, dto.getTel());
			psmt.setString(5, dto.getAttachedFile());
			psmt.setString(6, dto.getF_no());
			affected = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return affected;
	}
	
	public int getNextVal() {
		String sql = "SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = UPPER('seq_foodtrucks')";
		int maxNum=0;
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1)!=null)maxNum=rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return maxNum;
		}
		return maxNum;
	}
}
