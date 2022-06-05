import BasketList from '../components/BasketList.js'
import { Container } from 'react-bootstrap'

const Basket = () => {
    return (
        <Container style={{background: '#fff', borderRadius: '15px', width: '800px', padding: '20px 30px'}}>
            <h1 style={{textAlign: 'center'}}>Корзина</h1>
            <BasketList />
        </Container>
    )
}

export default Basket