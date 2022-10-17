import { post } from '../../utils/ApiCaller'

const useReport = () => {
    const createReport = (userId, postId, reason) =>
        post({ endpoint: `/api/user/${userId}/report`, body: { postsId: postId, reason: reason } })

    return { createReport }
}

export default useReport
