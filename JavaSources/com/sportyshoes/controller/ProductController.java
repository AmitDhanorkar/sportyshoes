package com.sportyshoes.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sportyshoes.bean.PurchaseReport;
import com.sportyshoes.entity.Order;
import com.sportyshoes.entity.Product;
import com.sportyshoes.entity.User;
import com.sportyshoes.services.OrderService;
import com.sportyshoes.services.ProductService;
import com.sportyshoes.services.UserService;


@Controller
public class ProductController {

	@Autowired
	ProductService productService;

	@Autowired
	private UserService userService;

	@Autowired
	private OrderService orderService;

	@RequestMapping(value="/listProducts", method=RequestMethod.GET)
	public String listAllProducts(Model model) {
		List<Product> list = productService.listAllProducts();
		model.addAttribute("listProducts", list);
		return "sportyshoeslist";
	}

	@RequestMapping(value="/addProducts", method=RequestMethod.GET)
	public String addProducts(Model model) {
		Product product = new Product();
		model.addAttribute("product",product);
		return "addProduct";
	}

	@RequestMapping(value="/addProducts", method=RequestMethod.POST)
	public String saveProduct(Model model, @ModelAttribute("product") Product product) {
		productService.addProduct(product);
		return "success";
	}

	@RequestMapping(value="/editProduct", method=RequestMethod.GET)
	public String editProduct(@RequestParam("id") long id, Model model) {
		model.addAttribute("product",productService.findProductById(id));
		return "addProduct";
	}

	@RequestMapping(value="/deleteProduct", method=RequestMethod.GET)
	public String deleteaProduct(Model model, @ModelAttribute("product") Product product) {
		productService.deleteProduct(product.getId());
		return "redirect:/listProducts";
	}

	@RequestMapping(value="/orderedShoes", method=RequestMethod.POST)
	@ResponseBody
	public String orderedShoes(@RequestParam("id") String id, @RequestParam("username") String username) {
		Product product = productService.findProductById(Long.valueOf(id));
		User user = userService.findByUsername(username);
		Order order = new Order();
		order.setProductId(Long.valueOf(id));
		order.setName(product.getName());
		order.setCustomerID(user.getId());

		orderService.addOrder(order);

		return "Done";
	}

	@RequestMapping(value="/orderHistory", method=RequestMethod.GET)
	public String orderHistory(@RequestParam("username") String username, Model model) {
		User user = userService.findByUsername(username);
		long customerID = user.getId();
		List<Order> list = orderService.findOrdersByCustomerID(customerID);
		model.addAttribute("listOrders", list);
		return "orderhistory";
	}

	@RequestMapping(value="/purchaseReport", method=RequestMethod.GET)
	public String purchaseReport(Model model) {
		List<PurchaseReport> purchaseReports = new ArrayList<PurchaseReport>();
		PurchaseReport report = null;

		List<Order> listOrders = orderService.listAllOrders();
		if(listOrders != null && !listOrders.isEmpty()) {
			for (Order order : listOrders) {
				report = new PurchaseReport();
				Product product = productService.findProductById(order.getProductId());
				User user = userService.findUserById(order.getCustomerID());

				report.setProductId(product.getId());
				report.setProductName(product.getName());
				report.setProductPrice(product.getPrice());
				report.setProductCategory(product.getCategory());
				report.setProductOrderedBy(user.getUsername());
				report.setProductOrderedOn(order.getCreatedDt());
				purchaseReports.add(report);
			}
		}
		model.addAttribute("purchaseReports", purchaseReports);
		return "purchasereport";
	}

	@RequestMapping(value = "/filterPurchaseHistory", method = RequestMethod.GET)	
	public String filterPurchaseHistory( @RequestParam(value = "fromDate", required = false) String fromDate, @RequestParam(value = "toDate", required = false) String toDate, @RequestParam(value = "category", required = false) String category, Model model) throws ParseException {
		List<PurchaseReport> purchaseReports = new ArrayList<PurchaseReport>();
		PurchaseReport report = null;
		List<Order> listOrders = null;
		Date newFromDate = null;
		Date newToDate = null;

		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
		if(fromDate != null && toDate != null && "".equals(category)) {
			newFromDate = formatter.parse(fromDate);
			newToDate = formatter.parse(toDate);
			listOrders = orderService.findOrdersByFromDateAndToDate(newFromDate, newToDate);
		} else if(fromDate == null && toDate == null && !category.isEmpty()) {
			listOrders = orderService.findOrdersByCategory(category);
		} else if(fromDate != null && toDate != null && !category.isEmpty()) {
			newFromDate = formatter.parse(fromDate);
			newToDate = formatter.parse(toDate);
			listOrders = orderService.findOrdersByFromDateAndToDateAndCategory(category, newFromDate, newToDate);
		} else {
			listOrders = orderService.listAllOrders();
		}

		if(listOrders != null && !listOrders.isEmpty()) {
			for (Order order : listOrders) {
				report = new PurchaseReport();
				Product product = productService.findProductById(order.getProductId());
				User user = userService.findUserById(order.getCustomerID());

				report.setProductId(product.getId());
				report.setProductName(product.getName());
				report.setProductPrice(product.getPrice());
				report.setProductCategory(product.getCategory());
				report.setProductOrderedBy(user.getUsername());
				report.setProductOrderedOn(order.getCreatedDt());
				purchaseReports.add(report);
			}
		}

		model.addAttribute("purchaseReports", purchaseReports);
		return "purchasereport";
	}
}
