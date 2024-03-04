import cv2

def add_text_to_video(input_file, output_file, text):
    # Open the video file
    video = cv2.VideoCapture(input_file)
    
    # Get video properties
    width = int(video.get(cv2.CAP_PROP_FRAME_WIDTH))
    height = int(video.get(cv2.CAP_PROP_FRAME_HEIGHT))
    fps = video.get(cv2.CAP_PROP_FPS)
    fps = 120

    print(f"fps = {fps}")

    # Define the codec for output video
    fourcc = cv2.VideoWriter_fourcc(*"mp4v")
    
    # Create VideoWriter object to write the output video
    writer = cv2.VideoWriter(output_file, fourcc, fps, (width, height))
    
    while True:
        # Read a frame from the video
        ret, frame = video.read()
        
        # Break the loop if no frame is returned
        if not ret:
            break
        
        # Add text to the frame
        cv2.putText(frame, text, (50, 50), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
        
        # Write the modified frame to the output video
        writer.write(frame)
        
        # Display the frame (optional)
        cv2.imshow("Frame", frame)
        
        # Exit if 'q' is pressed
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break
    
    # Release the resources
    video.release()
    writer.release()
    cv2.destroyAllWindows()

# Example usage
input_file = "youTube_video.mp4"
output_file = "output.mp4"
text = "Hello, OpenCV!"

add_text_to_video(input_file, output_file, text)