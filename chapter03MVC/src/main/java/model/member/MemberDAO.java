package model.member;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
		System.out.println("&&&&&&&&&insertMember&&&&&&&&&&&&&");
		try {
			
			System.out.println("-----------try insertMember-------------");
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
				medto.setJob(rs.getString(5));
				medto.setAge(rs.getString(6));
				medto.setHobby(rs.getString(7));
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
	
	
}
