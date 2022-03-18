package com.sportyshoes.servicesImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportyshoes.services.ProductService;
import com.sportyshoes.entity.Product;
import com.sportyshoes.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductRepository productRepository;

	public void addProduct(Product product) {
		if(product.getId() > 0) {
			Product existProduct = productRepository.findOne(product.getId());
			existProduct.setName(product.getName());
			existProduct.setPrice(product.getPrice());
			existProduct.setCategory(product.getCategory());
			productRepository.save(existProduct);
		} else {
			productRepository.save(product);
		}
	}

	public void deleteProduct(long productId) {
		productRepository.delete(productId);
	}

	public List<Product> listAllProducts() {
		return productRepository.findAll();
	}

	public Product findProductById(long productId) {
		return productRepository.findOne(productId);
	}

}
