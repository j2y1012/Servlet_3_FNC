package com.iu.notice.beforesearch;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.util.DBConnector;

public class NoticeDAO {
	
	
	

		
		
	
	//getTotalCount
	public int getTotalCount() throws Exception{
		Connection con = DBConnector.getConnect();
		String sql ="select nvl(count(num), 0) from notice";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		rs.next();
		int totalCount=rs.getInt(1);
		DBConnector.disConnect(rs, st, con);
		return totalCount;
	}
	
	//hitUpdate
	public int hitUpdate(int num)throws Exception{
		Connection con = DBConnector.getConnect();
		String sql ="update notice set hit=hit+1 where num=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	
	//selectList
	public ArrayList<NoticeDTO> selectList(int startRow, int lastRow) throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql ="select * from "
				+ "(select rownum R, N.* from "
				+ "(select * from notice order by num desc) N) "
				+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, startRow);
		st.setInt(2, lastRow);
		
		ResultSet rs = st.executeQuery();
		ArrayList<NoticeDTO> ar = new ArrayList<>();
		
		while(rs.next()) {
			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getDate("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
			ar.add(noticeDTO);
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return ar;
	}
	
	//selectOne
	public NoticeDTO selectOne(int num) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql ="select * from notice where num=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs = st.executeQuery();
		NoticeDTO noticeDTO = null;
		if(rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
			noticeDTO.setTitle(rs.getString("title"));
			noticeDTO.setWriter(rs.getString("writer"));
			noticeDTO.setContents(rs.getString("contents"));
			noticeDTO.setReg_date(rs.getDate("reg_date"));
			noticeDTO.setHit(rs.getInt("hit"));
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return noticeDTO;
	}
	
	//insert
	public int insert(NoticeDTO noticeDTO)throws Exception {
		Connection con = DBConnector.getConnect();
		
		String sql="insert into notice values(board_seq.nextval,?,?,?,sysdate,0)";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getWriter());
		st.setString(3, noticeDTO.getContents());
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	//update
	public int update(NoticeDTO noticeDTO)throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "update notice set title=?, contents=? where num=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getContents());
		st.setInt(3, noticeDTO.getNum());
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
	}
	
	//delete
	public int delete(int num)throws Exception{
		Connection con = DBConnector.getConnect();
		
		String sql ="delete notice where num=?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, num);
		
		int result = st.executeUpdate();
		
		DBConnector.disConnect(st, con);
		
		return result;
	}

}
