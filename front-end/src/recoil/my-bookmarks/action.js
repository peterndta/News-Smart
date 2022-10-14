import { get } from '../../utils/ApiCaller'

const useMyBookmarks = () => {
    const getMyBookmarkPosts = (params, pageNum = 1) =>
        get({ endpoint: `/api/post/bookmark/page/${pageNum}${params}` })

    return { getMyBookmarkPosts }
}

export default useMyBookmarks
