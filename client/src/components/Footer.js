import { Container, Row, Col } from "react-bootstrap"
import { NavLink } from "react-router-dom"



const Footer = () => {
    return(
        <Container style={{paddingTop: '100px'}}>
            <Row>
                <Col>
                    <NavLink style={{display: 'flex'}} to="/" className='navbar-brand'>
                        <img src='image/logo.svg' alt='#'/>
                        <p style={{fontWeight: '700', fontSize: '18px', textTransform: 'uppercase', marginTop: '20px', marginLeft: '20px', color: '#fff'}}>SnikersSni 
                            <span style={{fontStyle: 'normal', fontWeight: '400', fontSize: '14px', display: 'block'}}>StreetStyle</span>
                        </p>
                    </NavLink>
                </Col>
                <Col>
                    <ul style={{listStyleType: 'none', display: 'flex', marginTop: '27px', marginLeft: '30px'}}>
                        <li style={{paddingRight: '7px'}}><a href="https://vk.com" target="_blank" title="vk icons"><img style={{width: '40px'}} src="image/vk.png" /></a></li>
                        <li style={{paddingRight: '7px'}}><a href="https://telegram.org/" target="_blank" title="telegram icons"><img style={{width: '40px'}} src="image/telegram.png" /></a></li>
                        <li style={{paddingRight: '7px'}}><a href="https://instagram.com/" target="_blank" title="instagram icons"><img style={{width: '40px'}} src="image/instagram.png" /></a></li>
                        <li style={{paddingRight: '7px'}}><a href="https://www.facebook.com/" target="_blank" title="facebook icons"><img style={{width: '40px'}} src="image/facebook.png" /></a></li>
                    </ul>
                </Col>
                <Col>
                    <p style={{color: '#fff', alignItems: 'center', fontSize: '8px', textAlign: 'center', marginTop: '41px'}}>© SNEAKERSSNI, Inc 2022</p>
                </Col>
            </Row>
        </Container>
    )
}

export default Footer