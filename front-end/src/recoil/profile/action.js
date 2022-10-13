import { get } from '../../utils/ApiCaller'

const useMyProfile = () => {
    const getRecentRecipes = (userid) =>
        get({
            endpoint: `/api/user/${userid}/post/page/1`,
            params: {
                Type: 'Newest',
                PageSize: 6,
            },
        })
    const getActivity = (userid) =>
        get({
            endpoint: `/api/user/${userid}/allactivity`,
        })

    return {
        getRecentRecipes,
        getActivity,
    }
}
export default useMyProfile
