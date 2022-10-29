import { get, post, put } from '../../utils/ApiCaller'

const useCollection = () => {
    const createCollection = (value) =>
        post({ endpoint: `/api/admin/collection`, body: { collectionName: value } })

    const getCollections = () => get({ endpoint: '/api/collection' })

    const addPostsToCollection = (collectionId, postsId) =>
        post({ endpoint: `/api/collection/${collectionId}/foodcollection`, body: postsId })

    const getRecipesWithCollection = (filters, pageNum = 1) =>
        get({ endpoint: `/api/collections/post/page/${pageNum}${filters}` })

    const updatePostsToCollection = (postId, collectionsId) =>
        put({ endpoint: `/api/post/${postId}/foodcollection`, body: collectionsId })

    return {
        createCollection,
        getCollections,
        addPostsToCollection,
        getRecipesWithCollection,
        updatePostsToCollection,
    }
}

export default useCollection
