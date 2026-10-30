package model.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBPKG.Util;

public class BoardDAO {
	
	Connection con = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	// 게시판 데이터 시작행~끝행의 개수를 리턴하는 메소드
	public ArrayList<BoardDTO> getAllboard(int startRow, int pageSize) {
		ArrayList<BoardDTO> bdtoList = new ArrayList<>();
		
		try {
			con = Util.getConnection();
			String sql = "select * from board order by ref desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO bdto = new BoardDTO();
				bdto.setNum(rs.getInt("num"));
				bdto.setWriter(rs.getString("writer"));				
				bdto.setEmail(rs.getString("email"));
				bdto.setSubject(rs.getString("subject"));
				bdto.setPassword(rs.getString("password"));
				bdto.setReg_date(rs.getString("reg_date"));
				bdto.setRef(rs.getInt("ref"));
				bdto.setRe_step(rs.getInt("re_step"));
				bdto.setReadcount(rs.getInt("readcount"));
				bdto.setContent(rs.getString("content"));
				bdto.setId(rs.getString("id"));
				bdtoList.add(bdto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) con.close();
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
			} catch (Exception e) {e.printStackTrace();}
		}
		return bdtoList;
	}
	
	// 모든 게시판 리턴
	public int getAllCount() {	
		int returnNum = 0;
		try {
			con = Util.getConnection();
			String sql = "select count(*) as count from board";
			pstmt = con.prepareStatement(sql);			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				returnNum = rs.getInt("count");
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) con.close();
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
			} catch (Exception e) {e.printStackTrace();}
		}
		return returnNum;
	}
	
	//
	//
	public void insertBoard(BoardDTO bdto) {
		
		int ref = 0;
		int re_step = 0;
		try {
			con = Util.getConnection();
			// 쿼리문 ref의 최대값을 검색해서 + 1을 하는 select문 필요
			String sql = "SELECT max(ref) as max from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ref = rs.getInt(1) + 1;
			}
			
			// insert 쿼리
			String insertSql = "INSERT INTO board "
					+ "(writer, email, subject, password, reg_date, ref, re_step, readcount, content, id) "
					+ "VALUES (?, ?, ?, ? , ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(insertSql);			
			
			pstmt.setString(1, bdto.getWriter());
			pstmt.setString(2, bdto.getEmail());
			pstmt.setString(3, bdto.getSubject());
			pstmt.setString(4, bdto.getPassword());
			pstmt.setString(5, bdto.getReg_date());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, 0);
			pstmt.setString(9, bdto.getContent());
			pstmt.setString(10, bdto.getId());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) con.close();
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
			} catch (Exception e) {e.printStackTrace();}
		}
	
	}
	
	public BoardDTO getBoard(int num) {
		BoardDTO bdto = new BoardDTO();
		try {
			con = Util.getConnection();
			String countSql = "update board set readcount = readcount+1 where num=?";
			pstmt = con.prepareStatement(countSql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();		
			
			
			// select문
			con = Util.getConnection();
			String sql = "select * from board where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bdto.setNum(rs.getInt("num"));
				bdto.setWriter(rs.getString("writer"));				
				bdto.setEmail(rs.getString("email"));
				bdto.setSubject(rs.getString("subject"));
				bdto.setPassword(rs.getString("password"));
				bdto.setReg_date(rs.getString("reg_date"));
				bdto.setRef(rs.getInt("ref"));
				bdto.setRe_step(rs.getInt("re_step"));
				bdto.setReadcount(rs.getInt("readcount"));
				bdto.setContent(rs.getString("content"));
				bdto.setId(rs.getString("id"));			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) con.close();
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
			} catch (Exception e) {e.printStackTrace();}
		}
		
		
		
		
		return bdto;
	}	
	
	
}
