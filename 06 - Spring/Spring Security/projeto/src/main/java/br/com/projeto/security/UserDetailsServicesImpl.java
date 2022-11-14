package br.com.projeto.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.projeto.models.UserModel;
import br.com.projeto.repositories.UserRepository;

@Service
@Transactional
public class UserDetailsServicesImpl implements UserDetailsService {
    @Autowired
    private UserRepository ur;

    @Override
    public UserDetails loadUserByUserName(String username) throws UserNameNotFoundException {
        UserModelo um = ur.finByUser(username)
        .orElseThrow(() -> new UsernameNotFoundExcption("Usuário não encontrado"));
        
        return new User(
            UserModel.getUser(),
            UserModel.getPassword(),
            true,
            true,
            true,
            true,
            UserModel.getAuthorities()
        );
    }
}
