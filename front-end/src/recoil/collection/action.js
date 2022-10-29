import { get, post } from '../../utils/ApiCaller'

const useCollection = () => {
    const createCollection = (value) =>
        post({ endpoint: `/api/admin/collection`, body: { collectionName: value } })

    const getCollections = () => get({ endpoint: '/api/collection' })

    const addPostsToCollection = (collectionId, postsId) =>
        post({ endpoint: `/api/collection/${collectionId}/foodcollection`, body: postsId })

    const getRecipesWithCollection = (filters, pageNum = 1) =>
        get({ endpoint: `/api/collections/post/page/${pageNum}${filters}` })

    return { createCollection, getCollections, addPostsToCollection, getRecipesWithCollection }
}

export default useCollection
