import { get } from '../../utils/ApiCaller'

const useMyRatings = () => {
    const getMyRatingPosts = (params, pageNum = 1) =>
        get({ endpoint: `/api/post/rating/page/${pageNum}${params}` })

    return { getMyRatingPosts }
}

export default useMyRatings
