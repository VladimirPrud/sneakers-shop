import { Container, Button } from 'react-bootstrap'
import { useContext } from 'react'
import { AppContext } from '../components/AppContext.js'
import { Link, useNavigate } from 'react-router-dom'
import { logout } from '../http/userAPI.js'

const User = (props) => {
    const { user } = useContext(AppContext)
    const navigate = useNavigate()


    const handleLogout = (event) => {
        logout()
        user.logout()
        navigate('/login', {replace: true})
    }


    return (
        <Container style={{background: '#fff', borderRadius: '15px', width: '800px'}}>
            <h1 style={{textAlign: 'center', marginBottom: '10px', paddingTop: '50px'}}>Личный кабинет</h1>
            <p style={{textAlign: 'center', marginBottom: '90px'}}>
                Это личный кабинет постоянного покупателя магазина
            </p>
            <Button style={{width: '550px', marginLeft: '113px', marginBottom: '30px'}}><Link style={{textDecoration: 'none', color: '#fff',padding: '10px 195px'}} to="/user/orders">История заказов</Link></Button>
            <Button style={{width: '550px', marginLeft: '113px', marginBottom: '50px'}} onClick={handleLogout}>Выйти</Button>
        </Container>
    )
}

export default User