import { post, get, put } from '../../utils/ApiCaller'

const useReport = () => {
    const createReport = (userId, postId, reason) =>
        post({ endpoint: `/api/user/${userId}/report`, body: { postsId: postId, reason: reason } })

    const getReports = (filters, pageNum = 1) =>
        get({ endpoint: `/api/name/postReport/page/${pageNum}${filters}` })

    const denyReport = (id) => put({ endpoint: '/api/admin/report', params: { reportId: id } })

    const approveReport = (id, message) => put({ endpoint: `/api/report/${id}`, body: message })

    return { createReport, getReports, denyReport, approveReport }
}

export default useReport
