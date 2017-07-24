package com.admin.entity.orders;

import java.io.Serializable;
import java.sql.Timestamp;


/**
 * @author Administrator
 *
 */
public class AddressModify implements Serializable{    
	/**
	 * 
	 */
	private static final long serialVersionUID = 8037219109188086017L;
	
	//定义的私有属性
	private String createdBy;
    private Timestamp creationDate;
    private String lastUpdateBy;  
	private Timestamp lastUpdateDate;
    private int callCnt;
    private String remark;
    private char stsCd;
    private String familyName;
    private String givenName;
    private String countryName;
    private String countryIsoCd;
    private String stateOrProvinceName;
    private String stateOrProvinceCd;
    private String cityName;
    private String addressLine1;
    private String addressLine2;
    private String addressLine3;
    private String postalCd;
    private String contactPhoneNo;
    private String email;
    private int saoId;
	private String carrierName;
	
    public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public Timestamp getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Timestamp creationDate) {
		this.creationDate = creationDate;
	}
	public String getLastUpdateBy() {
		return lastUpdateBy;
	}
	public void setLastUpdateBy(String lastUpdateBy) {
		this.lastUpdateBy = lastUpdateBy;
	}
	public Timestamp getLastUpdateDate() {
		return lastUpdateDate;
	}
	public void setLastUpdateDate(Timestamp lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}
	public int getCallCnt() {
		return callCnt;
	}
	public void setCallCnt(int callCnt) {
		this.callCnt = callCnt;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public char getStsCd() {
		return stsCd;
	}
	public void setStsCd(char stsCd) {
		this.stsCd = stsCd;
	}
	public String getFamilyName() {
		return familyName;
	}
	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}
	public String getGivenName() {
		return givenName;
	}
	public void setGivenName(String givenName) {
		this.givenName = givenName;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public String getCountryIsoCd() {
		return countryIsoCd;
	}
	public void setCountryIsoCd(String countryIsoCd) {
		this.countryIsoCd = countryIsoCd;
	}
	public String getStateOrProvinceName() {
		return stateOrProvinceName;
	}
	public void setStateOrProvinceName(String stateOrProvinceName) {
		this.stateOrProvinceName = stateOrProvinceName;
	}
	public String getStateOrProvinceCd() {
		return stateOrProvinceCd;
	}
	public void setStateOrProvinceCd(String stateOrProvinceCd) {
		this.stateOrProvinceCd = stateOrProvinceCd;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getAddressLine1() {
		return addressLine1;
	}
	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}
	public String getAddressLine2() {
		return addressLine2;
	}
	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}
	public String getAddressLine3() {
		return addressLine3;
	}
	public void setAddressLine3(String addressLine3) {
		this.addressLine3 = addressLine3;
	}
	public String getPostalCd() {
		return postalCd;
	}
	public void setPostalCd(String postalCd) {
		this.postalCd = postalCd;
	}
	public String getContactPhoneNo() {
		return contactPhoneNo;
	}
	public void setContactPhoneNo(String contactPhoneNo) {
		this.contactPhoneNo = contactPhoneNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getSaoId() {
		return saoId;
	}
	public void setSaoId(int saoId) {
		this.saoId = saoId;
	}
	public String getCarrierName() {
		return carrierName;
	}
	public void setCarrierName(String carrierName) {
		this.carrierName = carrierName;
	}

 


}