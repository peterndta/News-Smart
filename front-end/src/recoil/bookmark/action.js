import { post } from '../../utils/ApiCaller'

const useBookmark = () => {
    const handleBookmark = (postId, value) =>
        post({ endpoint: `/api/post/${postId}/bookmark`, body: { bookmark: value } })

    return { handleBookmark }
}

export default useBookmark
