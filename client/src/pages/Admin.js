import { Container, Button } from 'react-bootstrap'
import { useContext } from 'react'
import { AppContext } from '../components/AppContext.js'
import { Link, useNavigate } from 'react-router-dom'
import { logout } from '../http/userAPI.js'

const Admin = () => {
    const { user } = useContext(AppContext)
    const navigate = useNavigate()

    const handleLogout = (event) => {
        logout()
        user.logout()
        navigate('/login', {replace: true})
    }

    return (
        <Container style={{background: '#fff', borderRadius: '15px', width: '800px'}}>
            <h1 style={{textAlign: 'center', marginBottom: '10px', paddingTop: '50px'}}>Панель управления</h1>
            <p style={{textAlign: 'center', marginBottom: '60px'}}>
                Это панель управления магазином для администратора
            </p>
            <Button style={{width: '550px', marginLeft: '113px', marginBottom: '30px'}}>
                <Link to="/admin/orders" style={{ textDecoration: 'none', color: '#fff', padding: '10px 188px'}}>
                    Заказы в магазине
                </Link>
            </Button>
            <Button style={{width: '550px', marginLeft: '113px', marginBottom: '30px'}}>
                <Link to="/admin/categories" style={{textDecoration: 'none', color: '#fff',padding: '10px 184px'}}>
                    Категории каталога
                </Link>
            </Button>
            <Button style={{width: '550px', marginLeft: '113px', marginBottom: '30px'}}>
                <Link to="/admin/brands" style={{textDecoration: 'none', color: '#fff',padding: '10px 195px'}}>
                    Бренды каталога
                </Link>
            </Button>
            <Button style={{width: '550px', marginLeft: '113px', marginBottom: '30px'}}>
                <Link  to="/admin/products" style={{textDecoration: 'none', color: '#fff',padding: '10px 195px'}}>
                    Товары каталога
                </Link>
            </Button>
            
            <Button style={{width: '550px', marginLeft: '113px', marginBottom: '50px'}} onClick={handleLogout}>Выйти</Button>
        </Container>
    )
}

export default Admin