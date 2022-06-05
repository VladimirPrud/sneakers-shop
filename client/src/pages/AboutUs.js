import Container from 'react-bootstrap/Container'

const Contacts = () => {
    return (
        <Container style={{background: '#fff', borderRadius: '15px', width: '800px', padding: '20px 30px'}}>
            <h1 style={{textAlign: 'center'}}>О нас</h1>
            <p>Друзья, мы предлагаем вам только оригинальные кроссовки от мировых производителей — Adidas, Asics, Nike, Reebok, Puma, New balance ... <br/><br/> 
                Мы стараемся поддерживать такую ценовую политику, чтобы вы могли без переплат приобрести оригинальные, модные вещи за приемлемые деньги! Одни из самых низких цен в Бресте! <br/> <br/>
                Следите за обновлениями и новостями (социальные сети обновляется ежедневно)!
            </p>
        </Container>
    )
}

export default Contacts