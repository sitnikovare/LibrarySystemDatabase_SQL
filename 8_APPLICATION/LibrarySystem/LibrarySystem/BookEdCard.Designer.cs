
namespace LibrarySystem
{
    partial class BookEdCard
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
            this.label1 = new System.Windows.Forms.Label();
            this.bookID = new System.Windows.Forms.TextBox();
            this.publID = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.ednumb = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.amount = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.doa = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.depID = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.addBookEd = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(73, 50);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(61, 17);
            this.label1.TabIndex = 0;
            this.label1.Text = "ID книги";
            // 
            // bookID
            // 
            this.bookID.Location = new System.Drawing.Point(76, 70);
            this.bookID.Name = "bookID";
            this.bookID.Size = new System.Drawing.Size(168, 22);
            this.bookID.TabIndex = 1;
            // 
            // publID
            // 
            this.publID.Location = new System.Drawing.Point(76, 133);
            this.publID.Name = "publID";
            this.publID.Size = new System.Drawing.Size(168, 22);
            this.publID.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(73, 113);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(115, 17);
            this.label2.TabIndex = 2;
            this.label2.Text = "ID издательства";
            // 
            // ednumb
            // 
            this.ednumb.Location = new System.Drawing.Point(76, 198);
            this.ednumb.Name = "ednumb";
            this.ednumb.Size = new System.Drawing.Size(168, 22);
            this.ednumb.TabIndex = 5;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(73, 178);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(110, 17);
            this.label3.TabIndex = 4;
            this.label3.Text = "Номер издания";
            // 
            // amount
            // 
            this.amount.Location = new System.Drawing.Point(306, 70);
            this.amount.Name = "amount";
            this.amount.Size = new System.Drawing.Size(168, 22);
            this.amount.TabIndex = 7;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(303, 50);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(86, 17);
            this.label4.TabIndex = 6;
            this.label4.Text = "Количество";
            // 
            // doa
            // 
            this.doa.Location = new System.Drawing.Point(306, 133);
            this.doa.Name = "doa";
            this.doa.Size = new System.Drawing.Size(168, 22);
            this.doa.TabIndex = 9;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(303, 113);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(117, 17);
            this.label5.TabIndex = 8;
            this.label5.Text = "Дата получения";
            // 
            // depID
            // 
            this.depID.Location = new System.Drawing.Point(306, 198);
            this.depID.Name = "depID";
            this.depID.Size = new System.Drawing.Size(168, 22);
            this.depID.TabIndex = 11;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(303, 178);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(72, 17);
            this.label6.TabIndex = 10;
            this.label6.Text = "ID отдела";
            // 
            // addBookEd
            // 
            this.addBookEd.Location = new System.Drawing.Point(177, 255);
            this.addBookEd.Name = "addBookEd";
            this.addBookEd.Size = new System.Drawing.Size(187, 58);
            this.addBookEd.TabIndex = 12;
            this.addBookEd.Text = "Добавить";
            this.addBookEd.UseVisualStyleBackColor = true;
            this.addBookEd.Click += new System.EventHandler(this.addBookEd_Click);
            // 
            // BookEdCard
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(571, 372);
            this.Controls.Add(this.addBookEd);
            this.Controls.Add(this.depID);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.doa);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.amount);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.ednumb);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.publID);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.bookID);
            this.Controls.Add(this.label1);
            this.Name = "BookEdCard";
            this.Text = "Карта книжного издания";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox bookID;
        private System.Windows.Forms.TextBox publID;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox ednumb;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox amount;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox doa;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox depID;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Button addBookEd;
    }
}