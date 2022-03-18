package com.sportyshoes.services;

import java.util.List;

import com.sportyshoes.entity.Product;

public interface ProductService {
	
	public void addProduct(Product product);
	
	public void deleteProduct(long productId);
	
	public List<Product> listAllProducts();
	
	public Product findProductById(long productId);

}
