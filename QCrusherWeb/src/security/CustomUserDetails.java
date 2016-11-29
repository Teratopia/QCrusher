package security;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import data.User;

public class CustomUserDetails implements UserDetails {
	private User user;

	public CustomUserDetails(final User _user) {
		this.user = _user;
	}

	public CustomUserDetails() {
	}

	@Override
	public Collection<GrantedAuthority> getAuthorities() {
		final Set<GrantedAuthority> _grntdAuths = new HashSet<GrantedAuthority>();

		if (user != null && user.getRole() != null) {
			_grntdAuths.add(new SimpleGrantedAuthority(user.getRole().toString()));
		}

		return _grntdAuths;
	}

	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		if (this.user == null) {
			return null;
		}
		return this.user.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		// return this.user.isAccountNonExpired();
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// return this.user.isAccountNonLocked();
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// return this.user.isCredentialsNonExpired();
		return true;
	}

	@Override
	public boolean isEnabled() {
		// return this.user.isEnabled();
		return true;
	}

	public User getUser() {
		return user;
	}

	@Override
	public String toString() {
		return "CustomUserDetails [user=" + user + "]";
	}
}
