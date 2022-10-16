import { get } from '../../utils/ApiCaller'

const useMyProfile = () => {
    const getRecentRecipes = (userId) =>
        get({
            endpoint: `/api/user/${userId}/post/page/1`,
            params: {
                Sort: 'Newest',
                PageSize: 6,
            },
        })
    const getActivity = (userId) =>
        get({
            endpoint: `/api/user/${userId}/allactivity`,
        })

    return {
        getRecentRecipes,
        getActivity,
    }
}
export default useMyProfile
