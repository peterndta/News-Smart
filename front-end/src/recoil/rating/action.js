import { post, put } from '../../utils/ApiCaller'

const useRating = () => {
    const createRating = (userId, postId, value) => {
        post({ endpoint: `/api/user/${userId}/post/${postId}/rating`, body: { rating: value } })
    }

    const updateRating = (userId, postId, value) =>
        put({ endpoint: `/api/user/${userId}/post/${postId}/rating`, body: { rating: value } })

    return { createRating, updateRating }
}

export default useRating
