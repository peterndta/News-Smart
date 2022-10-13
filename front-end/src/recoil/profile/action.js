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

    return {
        getRecentRecipes,
    }
}
export default useMyProfile
