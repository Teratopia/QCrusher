package controllers;

import static org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers.springSecurity;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

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
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import junit.framework.TestCase;

@ContextConfiguration(locations = {"classpath:security-config.xml", "welcomeController-config.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
public class WelcomeControllerTests extends TestCase {
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
	@SuppressWarnings("unused")
	public void test_root_and_welcome_return_when_logged_in(){
		try {
			MvcResult result = mockMvc.perform(get("/"))
				.andExpect(status().isOk())
				.andExpect(view().name(("welcome.jsp")))
				.andReturn();
			//--Can't test actual content, no good way to get rendered view
			//String content = result.getModelAndView().toString();
			//testing the actual nav
			//assertTrue(content.contains("Account"));
			
			result = mockMvc.perform(get("/welcome"))
					.andExpect(status().isOk())
					.andExpect(view().name(("welcome.jsp")))
					.andReturn();
			//content = result.getResponse().getContentAsString();
			//testing the actual nav
			//assertTrue(content.contains("Account"));
		} catch (Exception e) {
			e.printStackTrace();
			fail(e.toString());
		}	
	}
	
	@Test
	@WithAnonymousUser
	@SuppressWarnings("unused")
	public void test_welcome_returns_public_page_when_not_logged_in(){
		try {
			MvcResult result = mockMvc.perform(get("/"))
					.andExpect(status().isOk())
					.andExpect(view().name(("welcome.jsp")))
					.andReturn();
				//String content = result.getResponse().getContentAsString();
				//testing the actual nav
				//assertTrue(content.contains("Log In"));
				
		} catch (Exception e) {
			e.printStackTrace();
			fail(e.toString());
		}
	}
}
