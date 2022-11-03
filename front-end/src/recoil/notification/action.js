import { get, put } from '../../utils/ApiCaller'

const useNotification = () => {
    const getNewNotifications = (userId) =>
        get({ endpoint: `/api/user/${userId}/new-notifications` })

    const getNotifications = (userId, pageNum, filter) =>
        get({ endpoint: `/api/user/${userId}/notifications/page/${pageNum}${filter}` })

    const markReadNotifications = (userId) => put({ endpoint: `/api/user/${userId}/mark-read` })

    return { getNewNotifications, getNotifications, markReadNotifications }
}

export default useNotification
