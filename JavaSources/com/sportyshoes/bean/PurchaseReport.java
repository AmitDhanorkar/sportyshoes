package com.sportyshoes.bean;

import java.math.BigDecimal;
import java.util.Date;

public class PurchaseReport {

	private long productId;
	private String productName;
	private BigDecimal productPrice;
	private String productCategory;
	private Date productOrderedOn;
	private String productOrderedBy;
	
	public long getProductId() {
		return productId;
	}
	public void setProductId(long productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public BigDecimal getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(BigDecimal productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}
	public Date getProductOrderedOn() {
		return productOrderedOn;
	}
	public void setProductOrderedOn(Date productOrderedOn) {
		this.productOrderedOn = productOrderedOn;
	}
	public String getProductOrderedBy() {
		return productOrderedBy;
	}
	public void setProductOrderedBy(String productOrderedBy) {
		this.productOrderedBy = productOrderedBy;
	}
	
	public PurchaseReport() {
		super();
	}
	
	public PurchaseReport(long productId, String productName, BigDecimal productPrice, String productCategory,
			Date productOrderedOn, String productOrderedBy) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productCategory = productCategory;
		this.productOrderedOn = productOrderedOn;
		this.productOrderedBy = productOrderedBy;
	}
}
