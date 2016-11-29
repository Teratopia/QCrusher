package controllers;

import static org.junit.Assert.fail;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.security.test.context.support.WithAnonymousUser;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@ContextConfiguration(locations = {"classpath:security-config.xml", "accountController-config.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
public class AccountControllerTests {
	@Autowired
	WebApplicationContext wac;
	
	private MockMvc mockMvc;
	
	MockHttpServletRequest request;
	
	@Before
	public void setUp(){
		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).apply(springSecurity()).build();
		request = new MockHttpServletRequest();
	}
	
	@Test
	@WithMockUser
	public void test_account_returns_profile_when_logged_in(){
		try {
			mockMvc.perform(get("/account"))
				.andExpect(status().isOk())
				.andExpect(view().name(("profile.jsp")));
		} catch (Exception e) {
			e.printStackTrace();
			fail(e.toString());
		}	
	}
	
	@Test
	@WithAnonymousUser
	public void test_account_returns_login_when_not_logged_in(){
		try {
			mockMvc.perform(get("/account"))
				.andExpect(status().is3xxRedirection());
		} catch (Exception e) {
			e.printStackTrace();
			fail(e.toString());
		}
	}
}
