import { get } from '../../utils/ApiCaller'

const useMyRatings = (params, pageNum = 1) => {
    const getMyRatingPosts = () => get({ endpoint: `/api/post/rating/page/${pageNum}${params}` })

    return { getMyRatingPosts }
}

export default useMyRatings
