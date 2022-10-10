namespace reciWebApp.DTOs.StepDTOs
{
    public class ShowStepDTO
    {
        public int Id { get; set; }
        public string PostsId { get; set; }
        public string Ingredient { get; set; }
        public string Processing { get; set; }
        public string Cooking { get; set; }
        public string Tool { get; set; }
        public int ProcessingTime { get; set; }
        public int CookingTime { get; set; }
        public int PreparingTime { get; set; }
        public int Serving { get; set; }

    }
}