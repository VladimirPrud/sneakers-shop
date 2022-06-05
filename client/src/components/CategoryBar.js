import { ListGroup } from 'react-bootstrap'
import { useContext } from 'react'
import { AppContext } from './AppContext.js'
import { observer } from 'mobx-react-lite'
import { useNavigate, createSearchParams } from 'react-router-dom'

const CategoryBar = observer(() => {
    const { catalog } = useContext(AppContext)
    const navigate = useNavigate()

    const handleClick = (id) => {
        if (id === catalog.category) {
            catalog.category = null
        } else {
            catalog.category = id
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
        <ListGroup className="category-list">
            {catalog.categories.map(item =>
                <ListGroup.Item
                    key={item.id}
                    active={item.id === catalog.category}
                    onClick={() => handleClick(item.id)}
                    style={{
                        background: '#2C2828', 
                        color: '#fff', 
                        cursor: 'pointer',
                        padding: '10px 0 10px 10px',
                        margin: '10px 0 0 10px',
                        fontSize: '25px'
                        }}
                >
                    {item.name}
                </ListGroup.Item>
            )}
        </ListGroup>
    )
})

export default CategoryBar
