package com.iu.member;
import java.sql.*;
public class memberDTO {
private String ID;
private String PW;
private String NAME;
private String EMAIL;
private String PHONE;
private int AGE;
private String JOB;
public String getID() {
	return ID;
}
public void setID(String iD) {
	ID = iD;
}
public String getPW() {
	return PW;
}
public void setPW(String pW) {
	PW = pW;
}
public String getNAME() {
	return NAME;
}
public void setNAME(String nAME) {
	NAME = nAME;
}
public String getEMAIL() {
	return EMAIL;
}
public void setEMAIL(String eMAIL) {
	EMAIL = eMAIL;
}
public String getPHONE() {
	return PHONE;
}
public void setPHONE(String pHONE) {
	PHONE = pHONE;
}
public int getAGE() {
	return AGE;
}
public void setAGE(int aGE) {
	AGE = aGE;
}
public String getJOB() {
	return JOB;
}
public void setJOB(String jOB) {
	JOB = jOB;
}
}
