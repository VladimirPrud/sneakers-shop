import { Container, Navbar, Nav } from 'react-bootstrap'
import { NavLink } from 'react-router-dom'
import { AppContext } from './AppContext.js'
import { useContext } from 'react'
import { observer } from 'mobx-react-lite'

const NavBar = observer(() => {
    const { user, basket } = useContext(AppContext)
    return (
        <Navbar>
            <Container>
                <NavLink style={{display: 'flex'}} to="/" className='navbar-brand'>
                    <img src='image/logo.svg' alt='#'/>
                    <p style={{fontWeight: '700', fontSize: '18px', textTransform: 'uppercase', marginTop: '20px', marginLeft: '20px', color: '#fff'}}>Спортивная 
                        <span style={{fontStyle: 'normal', fontWeight: '400', fontSize: '14px', display: 'block'}}>Обувь</span>
                    </p>
                </NavLink>
                <Nav className="nav-links ml-auto">
                    <NavLink to="/shop" className="nav-link text-white">Каталог</NavLink>
                    <NavLink to="/about" className="nav-link text-white">О нас</NavLink>
                    {user.isAuth ? (
                        <NavLink to="/user" className="nav-link text-white">Личный кабинет</NavLink>
                    ) : (
                        <>
                            <NavLink to="/login" className="nav-link text-white">Войти</NavLink>
                            <NavLink to="/signup" className="nav-link text-white">Регистрация</NavLink>
                        </>
                    )}
                    {user.isAdmin && (
                        <NavLink to="/admin" className="nav-link text-white" >Панель управления</NavLink>
                    )}
                    <NavLink to="/basket" className="nav-link text-white">
                        Корзина
                        {!!basket.count && <span>({basket.count})</span>}
                    </NavLink>
                </Nav>
            </Container>
        </Navbar>
    )
})

export default NavBar