package model.member;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;

import DBPKG.Util;

public class MemberDAO {
	// 멤버변수
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	
	// sql
	// id 하나만 추출하는 메소드를 작성
	public String getId(String id) {
		String chkid = "";
		
		try {
			con = Util.getConnection();
			String sql = "select id from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				chkid = rs.getString(1);
			}	
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) con.close();
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();	
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}				
		
		return chkid;
	}
	
	public int insertMember (MemberDTO mdto) {
		int result = 0;
		
		try {

			con = Util.getConnection();
			String sql = "INSERT INTO member VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getId());
			pstmt.setString(2, mdto.getPass());
			pstmt.setString(3, mdto.getEmail());
			pstmt.setString(4, mdto.getTel());
			pstmt.setString(5, mdto.getJob());
			pstmt.setString(6, mdto.getAge());
			pstmt.setString(7, mdto.getHobby());
			pstmt.setString(8, mdto.getInfo());
			
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			
		}finally {
			try {
				if(con != null) con.close();
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public ArrayList<MemberDTO> allMemberList () {
		ArrayList<MemberDTO> memList = new ArrayList<>();
		try {
			con = Util.getConnection();
			String sql = "select * from member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				System.out.println("rs 1번" + rs.getString(1));
				MemberDTO medto = new MemberDTO();
				medto.setId(rs.getString(1));
				medto.setPass(rs.getString(2));
				medto.setEmail(rs.getString(3));
				medto.setTel(rs.getString(4));
				
				medto.setAge(rs.getString(7));
				medto.setJob(rs.getString(6));
				medto.setHobby(rs.getString(5));
				medto.setInfo(rs.getString(8));
				memList.add(medto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return memList;
	}
	
	public boolean loginCheck(String id, String pass) {
		boolean check = false;
		try {
			con = Util.getConnection();
			String sql = "select * from member where id = ? and pass = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				check=true;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (Exception e) {e.printStackTrace();}
		}		
		
		return check;
	}
	
	
	public ArrayList<MemberDTO> searchMemberList (String searchType, String param) {
		ArrayList<MemberDTO> memList = new ArrayList<>();
		try {
			System.out.println("여기는 try 들어간뒤 바로");
			con = Util.getConnection();
			String sql = "select * from member where " + searchType + " like '%" + param + "%'";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				System.out.println("rs next 몇번이냐??");
				System.out.println(rs.getString("id"));
				
				MemberDTO medto = new MemberDTO();
				medto.setId(rs.getString("id"));
				medto.setPass(rs.getString("pass"));
				medto.setEmail(rs.getString("email"));
				medto.setTel(rs.getString("tel"));
				
				medto.setAge(rs.getString("age"));
				medto.setJob(rs.getString("job"));
				medto.setHobby(rs.getString("hobby"));
				medto.setInfo(rs.getString("info"));
				
				memList.add(medto);
			}			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(con != null) con.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (Exception e) {e.printStackTrace();}
		}
		
		return memList;
	}
	
	public MemberDTO getMember(String id) {
		MemberDTO medto = new MemberDTO();
		
		try {
			con = Util.getConnection();
			String sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				medto.setId(rs.getString("id"));
				medto.setPass(rs.getString("pass"));
				medto.setEmail(rs.getString("email"));
				medto.setTel(rs.getString("tel"));
				
				medto.setAge(rs.getString("age"));
				medto.setJob(rs.getString("job"));
				medto.setHobby(rs.getString("hobby"));
				medto.setInfo(rs.getString("info"));
						
			}	
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) con.close();
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();	
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}				
		
		return medto;
	}
	
	public int updateMember(MemberDTO mdto) {
		int returnNum = 0;
		try {
			con = Util.getConnection();
			String sql = "UPDATE member set email = ?, tel = ?, job = ?, age = ?, info = ? where id = ?";
			pstmt = con.prepareStatement(sql);
			
//			pstmt.setString(2, mdto.getPass());
			pstmt.setString(1, mdto.getEmail());
			pstmt.setString(2, mdto.getTel());
			pstmt.setString(3, mdto.getJob());
			pstmt.setString(4, mdto.getAge());
//			pstmt.setString(7, mdto.getHobby());
			pstmt.setString(5, mdto.getInfo());	
			pstmt.setString(6, mdto.getId());
			returnNum = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(con != null) con.close();
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {e.printStackTrace();}
		}
		
		
		return returnNum;
	}
	
}
