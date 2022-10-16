import { get, post } from '../../utils/ApiCaller'

const useCollection = () => {
    const createCollection = (value) =>
        post({ endpoint: `/api/admin/collection`, body: { collectionName: value } })

    const getCollections = () => get({ endpoint: '/api/collections' })

    const addPostsToCollection = (collectionId, postsId) =>
        post({ endpoint: `/api/collection/${collectionId}/foodcollection`, body: postsId })

    return { createCollection, getCollections, addPostsToCollection }
}

export default useCollection
