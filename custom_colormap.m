% Define your custom colormap function
function custom_colormap_result = custom_colormap(threshold, option)
    num_colors = 256;
    base_colormap = zeros(num_colors, 3);
    
    switch option
        case "spectrum1"
            % Define the colors at different points
            darkBlue = [0, 0, 0.5]; % Dark blue
            purple = [0.5, 0, 0.5]; % Purple
            red = [1, 0, 0]; % Red
            yellow = [1, 1, 0]; % Yellow
            
            base_colormap(1:32, :) = linspace(0, 1, 32)' * (darkBlue - [0, 0, 0]) + [0, 0, 0]; % Transition to dark blue
            base_colormap(33:96, :) = linspace(0, 1, 64)' * (purple - darkBlue) + darkBlue; % Transition to purple
            base_colormap(97:160, :) = linspace(0, 1, 64)' * (red - purple) + purple; % Transition to red
            base_colormap(161:256, :) = linspace(0, 1, 96)' * (yellow - red) + red; % Transition to yellow
        
        case "shadows"
            % Define the colors at different points
            white = [1, 1, 1];  % White
            black = [0, 0, 0];  % Black
            base_colormap(:, :) = linspace(1, 0, num_colors)' * (white - black) + black;  % Reversed gradient
        case "greens"
            darkGreen = [0.05, 0.5, 0]; % Dark
            Green = [0.1, 0.6, 0]; % -
            lightGreen = [.15, 1, 0]; % Light
            yellow = [1, 1, 0]; % Yellow
            
            base_colormap(1:32, :) = linspace(0, 1, 32)' * (darkGreen - [0, 0, 0]) + [0, 0, 0]; % Transition to dark blue
            base_colormap(33:96, :) = linspace(0, 1, 64)' * (Green - darkGreen) + darkGreen; % Transition to purple
            base_colormap(97:160, :) = linspace(0, 1, 64)' * (lightGreen - Green) + Green; % Transition to red
            base_colormap(161:256, :) = linspace(0, 1, 96)' * (yellow - lightGreen) + lightGreen; % Transition to yellow
        case "blues"
            darkBlue = [0, 0.03, 0.3]; % Dark
            Blue = [0, 0.08, 0.65]; % -
            lightBlue = [0, .1, 1]; % Light
            yellow = [1, 1, 0]; % Yellow
            
            base_colormap(1:32, :) = linspace(0, 1, 32)' * (darkBlue - [0, 0, 0]) + [0, 0, 0]; % Transition to dark blue
            base_colormap(33:96, :) = linspace(0, 1, 64)' * (Blue - darkBlue) + darkBlue; % Transition to purple
            base_colormap(97:160, :) = linspace(0, 1, 64)' * (lightBlue - Blue) + Blue; % Transition to red
            base_colormap(161:256, :) = linspace(0, 1, 96)' * (yellow - lightBlue) + lightBlue; % Transition to yellow
        case "reds"
            darkRed = [0.4, 0, 0]; % Dark
            Red = [0.7, 0, 0]; % -
            lightRed = [1, 0, 0]; % Light
            yellow = [1, 1, 0]; % Yellow
            
            base_colormap(1:32, :) = linspace(0, 1, 32)' * (darkRed - [0, 0, 0]) + [0, 0, 0]; % Transition to dark Red
            base_colormap(33:96, :) = linspace(0, 1, 64)' * (Red - darkRed) + darkRed; % Transition to purple
            base_colormap(97:160, :) = linspace(0, 1, 64)' * (lightRed - Red) + Red; % Transition to red
            base_colormap(161:256, :) = linspace(0, 1, 96)' * (yellow - lightRed) + lightRed; % Transition to yellow
        case "cyans"
            darkCyan = [0, 0.4, 0.4]; % Dark
            Cyan = [0, 0.65, 0.65]; % -
            lightCyan = [0, 1, 1]; % Light
            yellow = [1, 1, 0]; % Yellow
            
            base_colormap(1:32, :) = linspace(0, 1, 32)' * (darkCyan - [0, 0, 0]) + [0, 0, 0]; % Transition to dark Cyan
            base_colormap(33:96, :) = linspace(0, 1, 64)' * (Cyan - darkCyan) + darkCyan; % Transition to purple
            base_colormap(97:160, :) = linspace(0, 1, 64)' * (lightCyan - Cyan) + Cyan; % Transition to Cyan
            base_colormap(161:256, :) = linspace(0, 1, 96)' * (yellow - lightCyan) + lightCyan; % Transition to yellow
        case "pinks"
            darkPink = [0.4, 0, 0.4]; % Dark
            Pink = [0.7, 0, 0.7]; % -
            lightPink = [1, 0, 1]; % Light
            yellow = [1, 1, 0]; % Yellow
            
            base_colormap(1:32, :) = linspace(0, 1, 32)' * (darkPink - [0, 0, 0]) + [0, 0, 0]; % Transition to dark Pink
            base_colormap(33:96, :) = linspace(0, 1, 64)' * (Pink - darkPink) + darkPink; % Transition to purple
            base_colormap(97:160, :) = linspace(0, 1, 64)' * (lightPink - Pink) + Pink; % Transition to Pink
            base_colormap(161:256, :) = linspace(0, 1, 96)' * (yellow - lightPink) + lightPink; % Transition to yellow
    end

    % Create the base colormap with transparent bottom
    transparent_bottom = ones(threshold, 3);  % NaN represents transparency
    custom_colormap_result = [transparent_bottom; base_colormap(threshold+1:end, :)];
    
end