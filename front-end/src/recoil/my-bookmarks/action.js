import { get } from '../../utils/ApiCaller'

const useMyBookmarks = (params, pageNum = 1) => {
    const getMyBookmarkPosts = () =>
        get({ endpoint: `/api/post/bookmark/page/${pageNum}${params}` })

    return { getMyBookmarkPosts }
}

export default useMyBookmarks
