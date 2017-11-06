package com.iu.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.iu.notice.beforesearch.NoticeDTO;
import com.iu.util.DBConnector;

public class memberDAO {
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
		ArrayList<memberDTO> ar = new ArrayList<>();
		
		while(rs.next()) {
			memberDTO memberDTO = new memberDTO();
			memberDTO.setID(rs.getString("ID"));
			memberDTO.setPW(rs.getString("PW"));
			memberDTO.setNAME(rs.getString("NAME"));
			memberDTO.setEMAIL(rs.getString("EMAIL"));
			memberDTO.setPHONE(rs.getString("PHONE"));
			memberDTO.setAGE(rs.getInt("AGE"));
			memberDTO.setJOB(rs.getString("JOB"));
			
		}
		
		DBConnector.disConnect(rs, st, con);
		
		return ar;
	}
	
	
	
	
	
	
public int insert(memberDTO memberDTO)throws Exception{
	Connection con=DBConnector.getConnect();
	String sql="insert into member values(?,?,?,?,?,?,?)";
	PreparedStatement st = con.prepareStatement(sql);
	st.setString(1, memberDTO.getID());
	st.setString(2, memberDTO.getPW());
	st.setString(3, memberDTO.getNAME());
	st.setString(4, memberDTO.getEMAIL());
	st.setString(5, memberDTO.getPHONE());
	st.setInt(6, memberDTO.getAGE());
	st.setString(7, memberDTO.getJOB());
	int result = st.executeUpdate();
	DBConnector.disConnect(st, con);
	return result;
}
}