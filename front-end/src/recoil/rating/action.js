import { post } from '../../utils/ApiCaller'

const useRating = () => {
    const createRating = (postId, value) =>
        post({ endpoint: `/api/post/${postId}/rating`, body: value })

    return { createRating }
}

export default useRating
