namespace FantasyBaseball
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.labCatch = new System.Windows.Forms.Label();
            this.labPitch = new System.Windows.Forms.Label();
            this.lab1B = new System.Windows.Forms.Label();
            this.lab2B = new System.Windows.Forms.Label();
            this.labSS = new System.Windows.Forms.Label();
            this.lab3B = new System.Windows.Forms.Label();
            this.labRF = new System.Windows.Forms.Label();
            this.labCF = new System.Windows.Forms.Label();
            this.labLF = new System.Windows.Forms.Label();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.cmboSortBy = new System.Windows.Forms.ComboBox();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.cmboMyTeams = new System.Windows.Forms.ComboBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.btnPlayBook = new System.Windows.Forms.Button();
            this.btnQuickPick = new System.Windows.Forms.Button();
            this.btnCatch = new System.Windows.Forms.Button();
            this.btnPitch = new System.Windows.Forms.Button();
            this.btn1B = new System.Windows.Forms.Button();
            this.btn2B = new System.Windows.Forms.Button();
            this.btnSS = new System.Windows.Forms.Button();
            this.btn3B = new System.Windows.Forms.Button();
            this.btnRF = new System.Windows.Forms.Button();
            this.btnCF = new System.Windows.Forms.Button();
            this.btnLF = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.btnSeeAllPlayers = new System.Windows.Forms.Button();
            this.btnAddtoRoster = new System.Windows.Forms.Button();
            this.checkSeeAvail = new System.Windows.Forms.CheckBox();
            this.dataGrid = new System.Windows.Forms.DataGridView();
            this.Rank = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.ADP = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.PlayerName = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Position = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Team = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Auction = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dbwithextrafieldDataSetBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.db__with_extra_fieldDataSet = new FantasyBaseball.db__with_extra_fieldDataSet();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.playersBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.playersTableAdapter = new FantasyBaseball.db__with_extra_fieldDataSetTableAdapters.PlayersTableAdapter();
            this.button1 = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.groupBox5.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.groupBox3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGrid)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dbwithextrafieldDataSetBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.db__with_extra_fieldDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.playersBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.labCatch);
            this.groupBox1.Controls.Add(this.labPitch);
            this.groupBox1.Controls.Add(this.lab1B);
            this.groupBox1.Controls.Add(this.lab2B);
            this.groupBox1.Controls.Add(this.labSS);
            this.groupBox1.Controls.Add(this.lab3B);
            this.groupBox1.Controls.Add(this.labRF);
            this.groupBox1.Controls.Add(this.labCF);
            this.groupBox1.Controls.Add(this.labLF);
            this.groupBox1.Controls.Add(this.groupBox5);
            this.groupBox1.Controls.Add(this.groupBox4);
            this.groupBox1.Controls.Add(this.groupBox3);
            this.groupBox1.Controls.Add(this.btnCatch);
            this.groupBox1.Controls.Add(this.btnPitch);
            this.groupBox1.Controls.Add(this.btn1B);
            this.groupBox1.Controls.Add(this.btn2B);
            this.groupBox1.Controls.Add(this.btnSS);
            this.groupBox1.Controls.Add(this.btn3B);
            this.groupBox1.Controls.Add(this.btnRF);
            this.groupBox1.Controls.Add(this.btnCF);
            this.groupBox1.Controls.Add(this.btnLF);
            this.groupBox1.Controls.Add(this.pictureBox1);
            this.groupBox1.Location = new System.Drawing.Point(23, 123);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(928, 514);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            // 
            // labCatch
            // 
            this.labCatch.AutoSize = true;
            this.labCatch.Location = new System.Drawing.Point(472, 481);
            this.labCatch.Name = "labCatch";
            this.labCatch.Size = new System.Drawing.Size(35, 13);
            this.labCatch.TabIndex = 25;
            this.labCatch.Text = "label9";
            this.labCatch.Click += new System.EventHandler(this.labCatch_Click);
            // 
            // labPitch
            // 
            this.labPitch.AutoSize = true;
            this.labPitch.Location = new System.Drawing.Point(508, 413);
            this.labPitch.Name = "labPitch";
            this.labPitch.Size = new System.Drawing.Size(35, 13);
            this.labPitch.TabIndex = 24;
            this.labPitch.Text = "label8";
            this.labPitch.Click += new System.EventHandler(this.labPitch_Click);
            // 
            // lab1B
            // 
            this.lab1B.AutoSize = true;
            this.lab1B.Location = new System.Drawing.Point(625, 444);
            this.lab1B.Name = "lab1B";
            this.lab1B.Size = new System.Drawing.Size(35, 13);
            this.lab1B.TabIndex = 23;
            this.lab1B.Text = "label7";
            this.lab1B.Click += new System.EventHandler(this.lab1B_Click);
            // 
            // lab2B
            // 
            this.lab2B.AutoSize = true;
            this.lab2B.Location = new System.Drawing.Point(636, 356);
            this.lab2B.Name = "lab2B";
            this.lab2B.Size = new System.Drawing.Size(35, 13);
            this.lab2B.TabIndex = 22;
            this.lab2B.Text = "label6";
            this.lab2B.Click += new System.EventHandler(this.lab2B_Click);
            // 
            // labSS
            // 
            this.labSS.AutoSize = true;
            this.labSS.Location = new System.Drawing.Point(558, 280);
            this.labSS.Name = "labSS";
            this.labSS.Size = new System.Drawing.Size(35, 13);
            this.labSS.TabIndex = 21;
            this.labSS.Text = "label5";
            this.labSS.Click += new System.EventHandler(this.labSS_Click);
            // 
            // lab3B
            // 
            this.lab3B.AutoSize = true;
            this.lab3B.Location = new System.Drawing.Point(478, 288);
            this.lab3B.Name = "lab3B";
            this.lab3B.Size = new System.Drawing.Size(35, 13);
            this.lab3B.TabIndex = 20;
            this.lab3B.Text = "label4";
            this.lab3B.Click += new System.EventHandler(this.lab3B_Click);
            // 
            // labRF
            // 
            this.labRF.AutoSize = true;
            this.labRF.Location = new System.Drawing.Point(798, 389);
            this.labRF.Name = "labRF";
            this.labRF.Size = new System.Drawing.Size(35, 13);
            this.labRF.TabIndex = 19;
            this.labRF.Text = "label3";
            this.labRF.Click += new System.EventHandler(this.labRF_Click);
            // 
            // labCF
            // 
            this.labCF.AutoSize = true;
            this.labCF.Location = new System.Drawing.Point(726, 208);
            this.labCF.Name = "labCF";
            this.labCF.Size = new System.Drawing.Size(35, 13);
            this.labCF.TabIndex = 18;
            this.labCF.Text = "label2";
            this.labCF.Click += new System.EventHandler(this.labCF_Click);
            // 
            // labLF
            // 
            this.labLF.AutoSize = true;
            this.labLF.Location = new System.Drawing.Point(537, 144);
            this.labLF.Name = "labLF";
            this.labLF.Size = new System.Drawing.Size(35, 13);
            this.labLF.TabIndex = 17;
            this.labLF.Text = "label1";
            this.labLF.Click += new System.EventHandler(this.labLF_Click);
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.Add(this.cmboSortBy);
            this.groupBox5.Location = new System.Drawing.Point(24, 223);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(297, 129);
            this.groupBox5.TabIndex = 16;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "Sort By";
            // 
            // cmboSortBy
            // 
            this.cmboSortBy.FormattingEnabled = true;
            this.cmboSortBy.Items.AddRange(new object[] {
            "Team Name",
            "Player Name",
            "Player Rank",
            "Position",
            "Price"});
            this.cmboSortBy.Location = new System.Drawing.Point(15, 47);
            this.cmboSortBy.Name = "cmboSortBy";
            this.cmboSortBy.Size = new System.Drawing.Size(231, 21);
            this.cmboSortBy.TabIndex = 0;
            this.cmboSortBy.SelectedIndexChanged += new System.EventHandler(this.cmboSortBy_SelectedIndexChanged);
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.cmboMyTeams);
            this.groupBox4.Location = new System.Drawing.Point(24, 377);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(298, 103);
            this.groupBox4.TabIndex = 15;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "View";
            // 
            // cmboMyTeams
            // 
            this.cmboMyTeams.FormattingEnabled = true;
            this.cmboMyTeams.Items.AddRange(new object[] {
            "Team 1",
            "Team 2",
            "Team 3"});
            this.cmboMyTeams.Location = new System.Drawing.Point(15, 43);
            this.cmboMyTeams.Name = "cmboMyTeams";
            this.cmboMyTeams.Size = new System.Drawing.Size(231, 21);
            this.cmboMyTeams.TabIndex = 0;
            this.cmboMyTeams.Text = "My Teams";
            this.cmboMyTeams.SelectedIndexChanged += new System.EventHandler(this.cmboMyTeams_SelectedIndexChanged);
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.btnPlayBook);
            this.groupBox3.Controls.Add(this.btnQuickPick);
            this.groupBox3.Location = new System.Drawing.Point(24, 41);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(206, 161);
            this.groupBox3.TabIndex = 14;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Options";
            // 
            // btnPlayBook
            // 
            this.btnPlayBook.Location = new System.Drawing.Point(51, 92);
            this.btnPlayBook.Name = "btnPlayBook";
            this.btnPlayBook.Size = new System.Drawing.Size(89, 35);
            this.btnPlayBook.TabIndex = 1;
            this.btnPlayBook.Text = "Play Book";
            this.btnPlayBook.UseVisualStyleBackColor = true;
            this.btnPlayBook.Click += new System.EventHandler(this.btnPlayBook_Click);
            // 
            // btnQuickPick
            // 
            this.btnQuickPick.Location = new System.Drawing.Point(51, 37);
            this.btnQuickPick.Name = "btnQuickPick";
            this.btnQuickPick.Size = new System.Drawing.Size(89, 35);
            this.btnQuickPick.TabIndex = 0;
            this.btnQuickPick.Text = "Quick Pick";
            this.btnQuickPick.UseVisualStyleBackColor = true;
            this.btnQuickPick.Click += new System.EventHandler(this.btnQuickPick_Click);
            // 
            // btnCatch
            // 
            this.btnCatch.BackColor = System.Drawing.Color.Blue;
            this.btnCatch.ForeColor = System.Drawing.Color.White;
            this.btnCatch.Location = new System.Drawing.Point(430, 461);
            this.btnCatch.Name = "btnCatch";
            this.btnCatch.Size = new System.Drawing.Size(36, 33);
            this.btnCatch.TabIndex = 13;
            this.btnCatch.Text = "C";
            this.btnCatch.UseVisualStyleBackColor = false;
            this.btnCatch.Click += new System.EventHandler(this.btnCatch_Click);
            // 
            // btnPitch
            // 
            this.btnPitch.BackColor = System.Drawing.Color.Blue;
            this.btnPitch.ForeColor = System.Drawing.Color.White;
            this.btnPitch.Location = new System.Drawing.Point(507, 377);
            this.btnPitch.Name = "btnPitch";
            this.btnPitch.Size = new System.Drawing.Size(36, 33);
            this.btnPitch.TabIndex = 12;
            this.btnPitch.Text = "P";
            this.btnPitch.UseVisualStyleBackColor = false;
            this.btnPitch.Click += new System.EventHandler(this.btnPitch_Click);
            // 
            // btn1B
            // 
            this.btn1B.BackColor = System.Drawing.Color.Blue;
            this.btn1B.ForeColor = System.Drawing.Color.White;
            this.btn1B.Location = new System.Drawing.Point(624, 410);
            this.btn1B.Name = "btn1B";
            this.btn1B.Size = new System.Drawing.Size(36, 33);
            this.btn1B.TabIndex = 11;
            this.btn1B.Text = "1B";
            this.btn1B.UseVisualStyleBackColor = false;
            this.btn1B.Click += new System.EventHandler(this.btn1B_Click);
            // 
            // btn2B
            // 
            this.btn2B.BackColor = System.Drawing.Color.Blue;
            this.btn2B.ForeColor = System.Drawing.Color.White;
            this.btn2B.Location = new System.Drawing.Point(635, 320);
            this.btn2B.Name = "btn2B";
            this.btn2B.Size = new System.Drawing.Size(36, 33);
            this.btn2B.TabIndex = 10;
            this.btn2B.Text = "2B";
            this.btn2B.UseVisualStyleBackColor = false;
            this.btn2B.Click += new System.EventHandler(this.btn2B_Click);
            // 
            // btnSS
            // 
            this.btnSS.BackColor = System.Drawing.Color.Blue;
            this.btnSS.ForeColor = System.Drawing.Color.White;
            this.btnSS.Location = new System.Drawing.Point(557, 244);
            this.btnSS.Name = "btnSS";
            this.btnSS.Size = new System.Drawing.Size(36, 33);
            this.btnSS.TabIndex = 9;
            this.btnSS.Text = "SS";
            this.btnSS.UseVisualStyleBackColor = false;
            this.btnSS.Click += new System.EventHandler(this.btnSS_Click);
            // 
            // btn3B
            // 
            this.btn3B.BackColor = System.Drawing.Color.Blue;
            this.btn3B.ForeColor = System.Drawing.Color.White;
            this.btn3B.Location = new System.Drawing.Point(477, 252);
            this.btn3B.Name = "btn3B";
            this.btn3B.Size = new System.Drawing.Size(36, 33);
            this.btn3B.TabIndex = 8;
            this.btn3B.Text = "3B";
            this.btn3B.UseVisualStyleBackColor = false;
            this.btn3B.Click += new System.EventHandler(this.btn3B_Click);
            // 
            // btnRF
            // 
            this.btnRF.BackColor = System.Drawing.Color.Blue;
            this.btnRF.ForeColor = System.Drawing.Color.White;
            this.btnRF.Location = new System.Drawing.Point(796, 350);
            this.btnRF.Name = "btnRF";
            this.btnRF.Size = new System.Drawing.Size(36, 33);
            this.btnRF.TabIndex = 7;
            this.btnRF.Text = "RF";
            this.btnRF.UseVisualStyleBackColor = false;
            this.btnRF.Click += new System.EventHandler(this.btnRF_Click);
            // 
            // btnCF
            // 
            this.btnCF.BackColor = System.Drawing.Color.Blue;
            this.btnCF.ForeColor = System.Drawing.Color.White;
            this.btnCF.Location = new System.Drawing.Point(724, 169);
            this.btnCF.Name = "btnCF";
            this.btnCF.Size = new System.Drawing.Size(36, 33);
            this.btnCF.TabIndex = 6;
            this.btnCF.Text = "CF";
            this.btnCF.UseVisualStyleBackColor = false;
            this.btnCF.Click += new System.EventHandler(this.btnCF_Click);
            // 
            // btnLF
            // 
            this.btnLF.BackColor = System.Drawing.Color.Blue;
            this.btnLF.ForeColor = System.Drawing.Color.White;
            this.btnLF.Location = new System.Drawing.Point(535, 104);
            this.btnLF.Name = "btnLF";
            this.btnLF.Size = new System.Drawing.Size(36, 33);
            this.btnLF.TabIndex = 5;
            this.btnLF.Text = "LF";
            this.btnLF.UseVisualStyleBackColor = false;
            this.btnLF.Click += new System.EventHandler(this.btnLF_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.pictureBox1.Image = global::FantasyBaseball.Properties.Resources.BaseballDiagram;
            this.pictureBox1.Location = new System.Drawing.Point(427, 19);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(463, 482);
            this.pictureBox1.TabIndex = 4;
            this.pictureBox1.TabStop = false;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.button1);
            this.groupBox2.Controls.Add(this.btnSeeAllPlayers);
            this.groupBox2.Controls.Add(this.btnAddtoRoster);
            this.groupBox2.Controls.Add(this.checkSeeAvail);
            this.groupBox2.Controls.Add(this.dataGrid);
            this.groupBox2.Location = new System.Drawing.Point(23, 645);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(928, 202);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            // 
            // btnSeeAllPlayers
            // 
            this.btnSeeAllPlayers.Location = new System.Drawing.Point(181, 169);
            this.btnSeeAllPlayers.Name = "btnSeeAllPlayers";
            this.btnSeeAllPlayers.Size = new System.Drawing.Size(141, 27);
            this.btnSeeAllPlayers.TabIndex = 3;
            this.btnSeeAllPlayers.Text = "See All Players";
            this.btnSeeAllPlayers.UseVisualStyleBackColor = true;
            this.btnSeeAllPlayers.Click += new System.EventHandler(this.btnSeeAllPlayers_Click);
            // 
            // btnAddtoRoster
            // 
            this.btnAddtoRoster.Location = new System.Drawing.Point(22, 169);
            this.btnAddtoRoster.Name = "btnAddtoRoster";
            this.btnAddtoRoster.Size = new System.Drawing.Size(141, 27);
            this.btnAddtoRoster.TabIndex = 2;
            this.btnAddtoRoster.Text = "Add to Roster";
            this.btnAddtoRoster.UseVisualStyleBackColor = true;
            this.btnAddtoRoster.Click += new System.EventHandler(this.btnAddtoRoster_Click);
            // 
            // checkSeeAvail
            // 
            this.checkSeeAvail.AutoSize = true;
            this.checkSeeAvail.Location = new System.Drawing.Point(769, 169);
            this.checkSeeAvail.Name = "checkSeeAvail";
            this.checkSeeAvail.Size = new System.Drawing.Size(91, 17);
            this.checkSeeAvail.TabIndex = 1;
            this.checkSeeAvail.Text = "See Available";
            this.checkSeeAvail.UseVisualStyleBackColor = true;
            this.checkSeeAvail.CheckedChanged += new System.EventHandler(this.checkSeeAvail_CheckedChanged);
            // 
            // dataGrid
            // 
            this.dataGrid.AutoGenerateColumns = false;
            this.dataGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGrid.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Rank,
            this.ADP,
            this.PlayerName,
            this.Position,
            this.Team,
            this.Auction});
            this.dataGrid.DataSource = this.dbwithextrafieldDataSetBindingSource;
            this.dataGrid.Location = new System.Drawing.Point(22, 27);
            this.dataGrid.Name = "dataGrid";
            this.dataGrid.Size = new System.Drawing.Size(894, 136);
            this.dataGrid.TabIndex = 0;
            this.dataGrid.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGrid_CellContentClick);
            // 
            // Rank
            // 
            this.Rank.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Rank.HeaderText = "Rank";
            this.Rank.Name = "Rank";
            // 
            // ADP
            // 
            this.ADP.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.ADP.HeaderText = "ADP";
            this.ADP.Name = "ADP";
            // 
            // PlayerName
            // 
            this.PlayerName.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.PlayerName.HeaderText = "Player Name";
            this.PlayerName.Name = "PlayerName";
            // 
            // Position
            // 
            this.Position.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Position.HeaderText = "Position";
            this.Position.Name = "Position";
            // 
            // Team
            // 
            this.Team.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Team.HeaderText = "Team";
            this.Team.Name = "Team";
            // 
            // Auction
            // 
            this.Auction.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Auction.HeaderText = "Auction";
            this.Auction.Name = "Auction";
            // 
            // dbwithextrafieldDataSetBindingSource
            // 
            this.dbwithextrafieldDataSetBindingSource.DataSource = this.db__with_extra_fieldDataSet;
            this.dbwithextrafieldDataSetBindingSource.Position = 0;
            // 
            // db__with_extra_fieldDataSet
            // 
            this.db__with_extra_fieldDataSet.DataSetName = "db__with_extra_fieldDataSet";
            this.db__with_extra_fieldDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // pictureBox2
            // 
            this.pictureBox2.Image = global::FantasyBaseball.Properties.Resources.baseball;
            this.pictureBox2.Location = new System.Drawing.Point(194, 11);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(586, 103);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox2.TabIndex = 2;
            this.pictureBox2.TabStop = false;
            // 
            // playersBindingSource
            // 
            this.playersBindingSource.DataMember = "Players";
            this.playersBindingSource.DataSource = this.dbwithextrafieldDataSetBindingSource;
            // 
            // playersTableAdapter
            // 
            this.playersTableAdapter.ClearBeforeFill = true;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(357, 173);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 4;
            this.button1.Text = "button1";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(969, 857);
            this.Controls.Add(this.pictureBox2);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox5.ResumeLayout(false);
            this.groupBox4.ResumeLayout(false);
            this.groupBox3.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGrid)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dbwithextrafieldDataSetBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.db__with_extra_fieldDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.playersBindingSource)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Button btnQuickPick;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.ComboBox cmboMyTeams;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Button btnCatch;
        private System.Windows.Forms.Button btnPitch;
        private System.Windows.Forms.Button btn1B;
        private System.Windows.Forms.Button btn2B;
        private System.Windows.Forms.Button btnSS;
        private System.Windows.Forms.Button btn3B;
        private System.Windows.Forms.Button btnRF;
        private System.Windows.Forms.Button btnCF;
        private System.Windows.Forms.Button btnLF;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.ComboBox cmboSortBy;
        private System.Windows.Forms.Button btnPlayBook;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.Label labCatch;
        private System.Windows.Forms.Label labPitch;
        private System.Windows.Forms.Label lab1B;
        private System.Windows.Forms.Label lab2B;
        private System.Windows.Forms.Label labSS;
        private System.Windows.Forms.Label lab3B;
        private System.Windows.Forms.Label labRF;
        private System.Windows.Forms.Label labCF;
        private System.Windows.Forms.Label labLF;
        private System.Windows.Forms.DataGridView dataGrid;
        private System.Windows.Forms.BindingSource dbwithextrafieldDataSetBindingSource;
        private db__with_extra_fieldDataSet db__with_extra_fieldDataSet;
        private System.Windows.Forms.Button btnAddtoRoster;
        private System.Windows.Forms.CheckBox checkSeeAvail;
        private System.Windows.Forms.Button btnSeeAllPlayers;
        private System.Windows.Forms.DataGridViewTextBoxColumn Rank;
        private System.Windows.Forms.DataGridViewTextBoxColumn ADP;
        private System.Windows.Forms.DataGridViewTextBoxColumn PlayerName;
        private System.Windows.Forms.DataGridViewTextBoxColumn Position;
        private System.Windows.Forms.DataGridViewTextBoxColumn Team;
        private System.Windows.Forms.DataGridViewTextBoxColumn Auction;
        private System.Windows.Forms.BindingSource playersBindingSource;
        private db__with_extra_fieldDataSetTableAdapters.PlayersTableAdapter playersTableAdapter;
        private System.Windows.Forms.Button button1;
    }
}

