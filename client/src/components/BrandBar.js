import { ListGroup } from 'react-bootstrap'
import { useContext } from 'react'
import { AppContext } from './AppContext.js'
import { observer } from 'mobx-react-lite'
import { useNavigate, createSearchParams } from 'react-router-dom'

const BrandBar = observer(() => {
    const { catalog } = useContext(AppContext)
    const navigate = useNavigate()

    const handleClick = (id) => {
        if (id === catalog.brand) {
            catalog.brand = null
        } else {
            catalog.brand = id
        }
        // при каждом клике добавляем в историю браузера новый элемент
        const params = {}
        if (catalog.category) params.category = catalog.category
        if (catalog.brand) params.brand = catalog.brand
        if (catalog.page > 1) params.page = catalog.page
        navigate({
            pathname: '/shop',
            search: '?' + createSearchParams(params),
        })
    }

    return (
        <ListGroup horizontal>
        {catalog.brands.map(item =>
            <ListGroup.Item
                key={item.id}
                active={item.id === catalog.brand}
                onClick={() => handleClick(item.id)}
                style={{
                    textAlign: 'center',
                    cursor: 'pointer',
                    padding: '0 20px 0 10px',
                    margin: '10px 0 20px 40px',
                    fontSize: '25px',
                    }}
            >
                {item.name}
            </ListGroup.Item>
        )}
        </ListGroup>
)
})
export default BrandBar