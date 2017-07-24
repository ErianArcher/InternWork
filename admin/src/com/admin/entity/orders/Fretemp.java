package com.admin.entity.orders;

import java.io.Serializable;
import java.math.BigDecimal;


/**
 * @author Administrator
 *
 */
public class Fretemp implements Serializable{
/**
	 * 
	 */
	private static final long serialVersionUID = -3334214394216947726L;
	//定义的私有属性
    private int freId;
    private String freCompany;
    private int warId;
	private String desCountry;
    private String desCountryId;
    private String desProvince;
    private String desProvinceId;
    private BigDecimal freFee;
    private String stsCd;
    
	public int getFreId() {
		return freId;
	}
	public void setFreId(int freId) {
		this.freId = freId;
	}
	public String getFreCompany() {
		return freCompany;
	}
	public void setFreCompany(String freCompany) {
		this.freCompany = freCompany;
	}
	  public int getWarId() {
			return warId;
		}
		public void setWarId(int warId) {
			this.warId = warId;
		}
	public String getDesCountry() {
		return desCountry;
	}
	public void setDesCountry(String desCountry) {
		this.desCountry = desCountry;
	}
	public String getDesCountryId() {
		return desCountryId;
	}
	public void setDesCountryId(String desCountryId) {
		this.desCountryId = desCountryId;
	}
	public String getDesProvince() {
		return desProvince;
	}
	public void setDesProvince(String desProvince) {
		this.desProvince = desProvince;
	}
	public String getDesProvinceId() {
		return desProvinceId;
	}
	public void setDesProvinceId(String desProvinceId) {
		this.desProvinceId = desProvinceId;
	}
	public BigDecimal getFreFee() {
		return freFee;
	}
	public void setFreFee(BigDecimal freFee) {
		this.freFee = freFee;
	}
	public String getStsCd() {
		return stsCd;
	}
	public void setStsCd(String stsCd) {
		this.stsCd = stsCd;
	}
    
	
}