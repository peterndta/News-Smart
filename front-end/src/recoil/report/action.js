import { post, get } from '../../utils/ApiCaller'

const useReport = () => {
    const createReport = (userId, postId, reason) =>
        post({ endpoint: `/api/user/${userId}/report`, body: { postsId: postId, reason: reason } })

    const getReports = (filters, pageNum = 1) =>
        get({ endpoint: `/api/name/postReport/page/${pageNum}${filters}` })

    const denyReport = (id) => get({ endpoint: '/api/admin/report', params: { reportId: id } })

    return { createReport, getReports, denyReport }
}

export default useReport
